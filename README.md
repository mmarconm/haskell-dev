# Projeto usado para construir ambiente de desenvolvimento com haskell no docker usando vscode (remote containers)

## Instalação de dependencias e Aplicações necessárias para desenvolver no vscode com Docker.

- Instale o docker no seu sistema operacional.
- Instale o vscode https://code.visualstudio.com
- Instale as extensões necessárias a seguir no seu vscode.
    - ms-vscode-remote.remote-containers
    - ms-azuretools.vscode-docker
    - justusadam.language-haskell


agora construa a imagem para o docker usando o comando abaixo.

```sh
docker build -t haskell_dev:9.1 .
# Isso poderá levar um tempo. dependerá do processamento de sua maquina e velocidade da conexão da internet. entre 20 minutos a 90 Minutos mais ou menos.
```

```sh
# Mude o tag de arcordo com sua necessidade.
docker build -t haskell_dev:9.1 .

# O nome haskell_dev:9.1 será o nome final da sua imagem + a tag. altere esse nome no arquivo .env localizado na pasta raiz do projeto.
# caso use outro nome. não esqueça de alterar dentro do arquivo .env disponivel em cada branch.

# Exemplo do arquivo .env
HASKELL_IMAGE=haskell_dev:9.1
STACK_PORT=4000
DB_IMAGE=postgres:12
DB_PORT=5434
REDIS_IMAGE=redis:6.0
REDIS_PORT=6379
```
### Como o ambiente configurado e os plugins no vscode instalado, principalmente o devcontainer. clique no icone ao canto inferior esquerdo com simbolo de 2 setas ><, abrirá uma caixa de menu, escolha a opção **REOPEN IN CONTAINER**

### Isso levará alguns minutos ( depende do hardware e conexão da sua maquina ), então vscode abrirá dentro do container diretamente.

## Comandos úteis para Docker.
```sh
# Listar todas as imagens
docker images

# Listar containers rodando
docker ps

# Listar todos os containers
docker ps -a

# Remover image
docker rmi nome_da_image:tag

# Parar container
docker stop nome_do_container

# Iniciar que está parado.
docker start nome_do_container

# Para mais informações sobre comandos do docker https://stack.desenvolvedor.expert/appendix/docker/comandos.html
```

## Comandos úteis para docker-compose.
```sh
# docker compose tem que ser usado dentro da pasta onde está disponivel o arquivo docker-compose.yaml

# Iniciar todos os containers
docker compose up

# Parar e destruir todos os containers e volumes criados
docker compose down -v

# Parar e destruir todos os containers ( sem remover os volumes )
docker compose down

# Mais informações sobre docker compose veja o link a seguir. https://docs.docker.com/compose/gettingstarted/
```

## Possiveis problemas e como resolver.

Quando tiver erro com o odoo ou dificuldade de criar um novo banco ou até mesmo após excluir um banco existente.
recomendo remover todos os serviços (containers) e seus volumes com o comando baixo.

```
# Realize o comando de dentro da pasta raiz onde se encontra o arquivo docker-compose.yaml
docker compose down -v
```
## O COMANDO ACIMA IRÁ REMOVER TODOS OS DADOS E VOLUMES QUANDO EXECUTADO. OU SEJA PERDERÁ TODAS AS INFORMAÇOES SALVAS.
## TENHA CERTEZA QUE TENHA FEITO ALGUM BACKUP ANTES DE EXECUTA-LO. ISSO SE O BACKUP FOR POSSIVEL =)