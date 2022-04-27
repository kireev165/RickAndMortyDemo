# WebAPI
API client for [The Rick and Morty API](rickandmortyapi.com)

## RestAPI
A REST API client implementation using callbacks.

### Basic Usage
```swift
let client = ApiClient()

// GET /character
client.character.getList() { _ in }

// GET /character?page=2
client.character.getList(page: 2) { _ in }

// GET /character/10
client.character.getOne(id: 10) { _ in }
```
