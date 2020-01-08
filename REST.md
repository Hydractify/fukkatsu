# REST

Base: `api.hydractify.org`

## Images

BasePath: `/images`

Authentication is required.

Supported content types for POST / PATCH / PUT are:
- `application/json`
- `x-www-form-urlencoded`
- `multipart/form-data`

Responses are always in `application/json`, unless explicitly noted.

### ER

See draw.io

### Routes

#### Reference

##### Image data
- `url`
- `tags` list of tag names
- `cycle` cycle name
- `moods` list of mood names
- `anime` list of anime (name and id)

#### Getting a random image
- `GET /random`

Parameters:
- [`tag`]
    name
- [`cycle`]
    name
- [`mood`]
    name
- [`anime`]
    id

Responses:
- `401` - Unauthorized
- `403` - Missing Access
- `404` - Not Found
- `200` - OK  
    Image data

#### Getting a specific image
- `GET /:id`

Responses:
- `401` - Unauthorized
- `403` - Missing Access
- `404` - Not Found
- `200` - OK  
    Image data


#### Creating an image
- `POST /`
> Expects multipart/form-data due to the image upload

Parameters:
- `image`
  image data
- [`anime`]
    ids
- [`tags`]
    names
- [`moods`]
    names
- [`cycles`]
    name

Responses:
- `400` - Bad Request
- - Missing content-type header
- - Missing `image` param
- - Invalid sub resources specified
- - Otherwise malformed data
- `401` - Unauthorized
- `403` - Missing Access
- `415` - Unsupported Media Type
- `201` - Created  
    Image data


#### Editing an image
- `PATCH /:id`
- `PUT /:id`

Same as creating, except no `image` and all supported content-types may be used.

Responses:
- `400` - Bad Request
- - Missing content-type header
- - Invalid sub resources specified
- - Otherwise malformed data
- `401` - Unauthorized
- `403` - Missing Access
- `404` - Not Found
- `415` - Unsupported Media Type
- `200` - OK  
    Image data

#### Sub resources

- `/anime`
- `/tags`
- `/moods`
- `/cycles`

Basic CRUD schema, no R though

