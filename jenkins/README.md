# Porque o modelo de Jenkins baseado em VM
Defini para esta poc o uso de um Jenkins sem roda em container pois
acredito que o uso de sock e jenkins como container não seria a melhor pratica
uma vez que o jenkins mantém sim em muitos casos estado e isto demanda uma serie
de inserções via API para faze-lo roda.
sendo assim segue os passos para criar seu jenkins.

## Instalando o Jenkins em um CentOS 7
```
setenforce 0
sed 's/SELINUX=enforcing/SELINUX=disabled/g' -i /etc/selinux/config
yum install -y epel-release
yum install -y vim screen wget curl git unzip java-1.8.0-openjdk-devel net-tools
yum install -y yum-utils   device-mapper-persistent-data lvm2
yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins
systemctl enable jenkins
systemctl start jenkins
```

## Acessando...

O jenkins irá criar um login primario com uma senha prédefinida instanciada no arquivo
```
cat /var/lib/jenkins/secrets/initialAdminPassword
```

Acesso o jenkins que por padrão roda na porta 8080 do servidor e informe a senha.

![alt text](http://1.png "Logo Title Text 1")


Após isto marque a opção "Select plugins to install" para adicionar o bitbucket.

Pesquise por bitbucket e adicione o plugin.

![alt text](http://2.png)

## Configurando

Marque install. Após instalar as aplicações crie um "Novo Job" informe o nome e utilize Multibranch Pipeline.

![alt text](http://3.png)

Em source adicione "git" e em Project Repository informe a url do projeto como se fosse fazer um git clone

Exemplo: git@bitbucket.org:larcbp/kiper-sre-challenge.git

![alt text](http://4.png)

Em credentials adicione uma global com Kind "SSH Username with private key". Clique em "Enter directly" e em Key adicione uma private key capaz de fazer clone do projeto.

![alt text](http://5.png)

Marque usa credencial para ser usada.

Bem ao final da pagina em "Registry credentials" faça um Add com Kind "Username with password" informando um usuario e senha para o registry

![alt text](http://6.png)
Salve e aplique.

Volte até a Home vá em Credentials, copie o ID da credencial criada para o registry e atualize esta informação no Jenkinsfile 
![alt text](http://7.png)
## Acessando usuario jenkins e configurando aws credentials....
Altere o usuario do jenkins para receber um bash

````
# /etc/passwd
jenkins:x:997:993:Jenkins Automation Server:/var/lib/jenkins:/bin/false
````

Para

````
jenkins:x:997:993:Jenkins Automation Server:/var/lib/jenkins:/bin/bash
````

Adicione permissao no usuario do jenkins para acessar o docker

````
usermod -aG docker jenkins
````

Adicione as credenciais da AWS

````
su - jenkins
aws configure
````

Reinicie o jenkins

````
systemctl restart jenkins
````


````
....
            steps{
                script {
                    docker.withRegistry("https://index.docker.io/v1/", 'altere a ID aqui') {
                        def customImage = docker.build("larcbp/kiper-sre-challenge:${BUILD_NUMBER}", ".")
                        /* Push the container to the custom Registry */
                        customImage.push()
                    }
                }
            }
....
````

O multiscan do Jenkins neste ponto já vai ter buscado as branchs com Jenkinsfile e basta solicitar um deploy da sua branch.