# Olympus Wi-Fi API Specification

## Overview

The version of this API is ```VER_100```, due to the return value of some API.

### Request

Protocol: HTTP

Host: ```http://192.168.0.10/```

The request type is ```GET``` when the API begins with ```get_```.

### Response

The response type can be either ```text/plain``` or XML, according to different API. And the text response is text based word or list.

## get\_commandlist

Input:
```
GET /get_commandlist
```

## get\_caminfo

Input:
```
GET /get_caminfo
```

Output:
```
E-M5 Mark II
```

## get\_imglist

Input:
```
GET /get_imglist?DIR=$PATH
```

Output:
```
```

## get\_thumbnail
