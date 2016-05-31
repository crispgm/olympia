# Olympus Wi-Fi API Specification

## Overview

The version of this API is ```VER_100```, due to the return value of some API.

### Request

Protocol: ```HTTP```

Host: ```http://192.168.0.10/```

All the request type is ```GET```.

### Response

The response type can be either ```text/plain``` or XML, according to different API. And the text response is text based word or list.

### Errors

The errors are unknown yet.

## get\_commandlist

Get commands list of the camera.

Input:
```
GET /get_commandlist.cgi
```

Output: OI Share version, support functions and API specification in XML.

## get\_connectmode

Get connect mode.

Input:
```
GET /get_connectmode.cgi
```

Output:
```
```

## switch_cammode

## get\_caminfo

Input:
```
GET /get_caminfo.cgi
```

Output:
```
E-M5 Mark II
```

## exec\_pwolf

## get\_resizeimg

Get resized images.

Input:
```
GET /get_resizeimg?DIR=$path&size=$size

# $size: 1024 | 1600 | 1920 | 2048, and it can be different from cameras.
```

Output:
```
```

## get\_movplaytime

## get\_rsvimglist

## get\_imglist

Get images list by path. Folders will also be returned in the list

Input:
```
GET /get_imglist?DIR=$PATH
```

Output:
```
```

## get\_thumbnail

## get\_screennail

## exec\_takemotion

## exec\_takemisc

## get\_camprop

## set\_camprop

## get\_activate

## set\_utctimediff

## get\_gpsdivunit

## get\_unusedcapacity

## get\_dcffilenum

## req\_attachexifgps

## req\_storegpsinfo

## exec\_shutter

Execute shutter(take shot).

Input:
```
GET /exec_shutter.cgi?com=$com

# $com: 1stpush, 2ndpush, 1st2ndpush, 2nd1strelease, 2ndrelease, 1strelease
```

Output:
```
```