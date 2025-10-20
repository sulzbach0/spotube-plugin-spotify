# Como Testar e Resolver o Erro 403

## Passos para Testar

### 1. Execute o Plugin
```bash
cd example
flutter run
```

### 2. Teste o Token
1. **Clique em "Usar Token Pessoal (Auto-Renovação)"**
2. **Clique em "Testar Token"**
3. **Verifique os logs** no console

### 3. Verifique os Logs
Procure por estas mensagens no console:
- `[setPersonalToken] Definindo token pessoal...`
- `[setPersonalToken] Token: BQB8D0No...`
- `[setPersonalToken] Token pessoal definido com sucesso!`
- `[Plugin] Access token definido: BQB8D0No...`
- `Está autenticado: true`

### 4. Teste uma Funcionalidade
1. **Clique em "Search Twenty One Pilots"**
2. **Verifique se retorna dados** ou erro 403

## Possíveis Problemas e Soluções

### Problema 1: Token Expirado
**Sintoma**: Erro 403 mesmo com token definido
**Solução**: 
```bash
# Obter novo token
curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=efdd522883a048b8adbbce3b4a103ec0&client_secret=717450b003f84e08bacc3cc460c2409c"
```

### Problema 2: Token Não Definido
**Sintoma**: `Está autenticado: false`
**Solução**: 
1. Clique em "Usar Token Pessoal" novamente
2. Verifique os logs

### Problema 3: API GraphQL Não Reconhece Token
**Sintoma**: Token definido mas ainda erro 403
**Solução**: 
- O token pode ser válido para Web API mas não para GraphQL
- Tente usar autenticação por cookie original

## Debug Avançado

### Verificar Token no LocalStorage
```javascript
// No console do navegador (se rodando na web)
localStorage.getItem('credentials')
```

### Verificar Headers da Requisição
Os logs devem mostrar:
- Token sendo definido
- Requisições sendo feitas com token

## Status Esperado
- ✅ Plugin carrega sem erro "NO RELEASES FOUND"
- ✅ Token é definido corretamente
- ✅ Requisições funcionam sem erro 403
- ✅ Busca retorna dados do Spotify

## Se Ainda Der Erro 403
O problema pode ser que o token do Client Credentials Flow não funciona com a API GraphQL do Spotify. Nesse caso, precisaremos usar a autenticação por cookie original.
