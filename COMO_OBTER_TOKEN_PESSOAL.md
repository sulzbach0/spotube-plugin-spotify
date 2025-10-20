# Como Obter Token Pessoal do Spotify

## Passo 1: Criar Aplicativo no Spotify Developer Dashboard

1. Acesse: https://developer.spotify.com/dashboard/applications
2. Faça login com sua conta Spotify
3. Clique em "Create an App"
4. Preencha:
   - **App name**: Seu nome (ex: "Meu Plugin Spotify")
   - **App description**: Descrição qualquer
   - **Website**: http://localhost (ou qualquer URL)
   - **Redirect URI**: http://localhost:8080/callback
5. Clique em "Save"
6. Anote o **Client ID** e **Client Secret**

## Passo 2: Obter Token de Acesso

### Opção A: Usando cURL (Recomendado)

```bash
# Substitua CLIENT_ID e CLIENT_SECRET pelos valores do seu app
curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=SEU_CLIENT_ID&client_secret=SEU_CLIENT_SECRET"
```

### Opção B: Usando Postman

1. **Method**: POST
2. **URL**: `https://accounts.spotify.com/api/token`
3. **Headers**: 
   - `Content-Type: application/x-www-form-urlencoded`
4. **Body** (x-www-form-urlencoded):
   - `grant_type`: `client_credentials`
   - `client_id`: `SEU_CLIENT_ID`
   - `client_secret`: `SEU_CLIENT_SECRET`

### Opção C: Usando JavaScript (Console do Navegador)

```javascript
fetch('https://accounts.spotify.com/api/token', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
  },
  body: 'grant_type=client_credentials&client_id=SEU_CLIENT_ID&client_secret=SEU_CLIENT_SECRET'
})
.then(response => response.json())
.then(data => console.log('Token:', data.access_token));
```

## Passo 3: Usar o Token no Plugin

1. Copie o `access_token` da resposta
2. No exemplo do plugin, substitua `SEU_TOKEN_AQUI` pelo token obtido
3. Clique em "Usar Token Pessoal"

## Resposta Esperada

```json
{
  "access_token": "BQC...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

## ⚠️ IMPORTANTE

- **Client Credentials Flow** só permite acesso a dados **públicos**
- Para acessar dados **pessoais** (playlists, perfil), você precisa do **Authorization Code Flow**
- Tokens expiram em 1 hora e precisam ser renovados

## Para Dados Pessoais (Authorization Code Flow)

Se precisar acessar dados pessoais, use este fluxo:

1. **URL de Autorização**:
```
https://accounts.spotify.com/authorize?client_id=SEU_CLIENT_ID&response_type=code&redirect_uri=http://localhost:8080/callback&scope=user-read-private%20user-read-email%20playlist-read-private
```

2. **Trocar código por token**:
```bash
curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=authorization_code&code=CODIGO_DA_URL&redirect_uri=http://localhost:8080/callback&client_id=SEU_CLIENT_ID&client_secret=SEU_CLIENT_SECRET"
```

## Troubleshooting

- **403 Error**: Token inválido ou expirado
- **400 Error**: Parâmetros incorretos
- **401 Error**: Client ID/Secret incorretos
