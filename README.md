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

## Haskell Links and Docs

- [Cabal Install](https://www.haskell.org/cabal/)
- [Cabal User Guide](https://cabal.readthedocs.io/en/3.6/)
- [Haskell](https://www.haskell.org/)
- [Haskell Beginner](https://www.haskellfromtheverybeginning.com/)


### Upgrade and install cabal
```sh
# abra seu .bashrc e adicione a linha abaixo.
export PATH=$HOME/.cabal/bin:$PATH
# or
echo 'export PATH=$HOME/.cabal/bin:$PATH' > $HOME/.bashrc && source $HOME/.bashrc 
# -- feche e abra o seu terminal para carregar o seu bashrc
```

```sh
cabal update

cabal install cabal-install

mkdir myproject && cd myproject
cabal init
cabal run

```

