# marvel-catalog-ios

Um breve catálogo de personagens da Marvel utilizando sua [API](https://developer.marvel.com/) oficial.

> Obs: Projeto criado para fins de estudo apenas.

### Depêndencias
[CocoaPods](https://cocoapods.org/#install) - Para instalar as depêndencias do XCode.  
[https://developer.marvel.com/](https://developer.marvel.com/) - Para gerar uma key para utilizar a API da Marvel.

### Instalando as depêndencias com [CocoaPods](https://cocoapods.org/#install)

``` shell
$ pod install
```

### Configuração da API

Deve se alterar o arquivo [Marvel Catalog/Api/Configs/ApiConfiguration.json](Marvel%20Catalog/Api/Configs/ApiConfiguration.json) modificando os valores YOUR_PUBLIC_KEY e YOUR_PRIVATE_KEY.

``` shell
{
    "url": "http://gateway.marvel.com/v1/public/",
    "publicKey": "YOUR_PUBLIC_KEY",
    "privateKey": "YOUR_PRIVATE_KEY"
}
```


### @todo
- [x] Fetch characters
- [x] Add pagination
- [x] Add animation in details
- [x] Add Seach Bar
- [ ] Check internet connection

### Exemplo da aplicação em execução (GIF em baixa qualidade)

<img src="https://media.giphy.com/media/dCLGMX73BwyebAIrVA/giphy.gif" width="400">

Made with love by [John R.](https://www.linkedin.com/in/johnlenonreis/) &#9829;
