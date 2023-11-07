# Index patterns

apm-*
elastic-stack-*
heartbeat-7-*
ingress-nginx-*
cattle-system-*
kube-system-*
collector-snmp-*
# Index Lifecycle
```
PUT _ilm/policy/apm-management
{
  "policy": {
    "_meta": {
      "description": "used for apm logs",
      "project": {
        "name": "vli",
        "department": "ti"
      }
    },
    "phases": {
      "delete": {
        "min_age": "7d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```
```
PUT _ilm/policy/elastic-stack-management
{
  "policy": {
    "_meta": {
      "description": "used for elastic-stack kubernetes logs",
      "project": {
        "name": "vli",
        "department": "ti"
      }
    },
    "phases": {
      "delete": {
        "min_age": "2d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```
```
PUT _ilm/policy/heartbeat-7-management
{
  "policy": {
    "_meta": {
      "description": "used for heartbeat logs",
      "project": {
        "name": "vli",
        "department": "ti"
      }
    },
    "phases": {
      "delete": {
        "min_age": "3d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```
```
PUT _ilm/policy/ingress-nginx-management
{
  "policy": {
    "_meta": {
      "description": "used for ingress-nginx kubernetes logs",
      "project": {
        "name": "vli",
        "department": "ti"
      }
    },
    "phases": {
      "delete": {
        "min_age": "3d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```
```
PUT _ilm/policy/kube-system-management
{
  "policy": {
    "_meta": {
      "description": "used for kube-system kubernetes logs",
      "project": {
        "name": "vli",
        "department": "ti"
      }
    },
    "phases": {
      "delete": {
        "min_age": "3d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```
```
PUT _ilm/policy/gitlab-management
{
  "policy": {
    "_meta": {
      "description": "used for gitlab kubernetes logs",
      "project": {
        "name": "vli",
        "department": "ti"
      }
    },
    "phases": {
      "delete": {
        "min_age": "3d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```
```
PUT _ilm/policy/collector-snmp
{
  "policy": {
    "_meta": {
      "description": "used for collector-snmp kubernetes logs",
      "project": {
        "name": "vli",
        "department": "ti"
      }
    },
    "phases": {
      "delete": {
        "min_age": "3d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```

# Index templates

Apply by Console DevTools

```
# heartbeat always create our index template

PUT apm-management*/_settings 
{
  "index": {
    "lifecycle": {
      "name": "apm-management"
    }
  }
}
```
```
PUT _index_template/elastic-stack-management
{
  "index_patterns": ["elastic-stack-management*"],
  "template": {
    "settings": {
      "number_of_shards": 1,
      "index.lifecycle.name": "elastic-stack-management"
    },
    "mappings": {
      "_source": {
        "enabled": true
      }
    }
  }
}
PUT elastic-stack-management*/_settings 
{
  "index": {
    "lifecycle": {
      "name": "elastic-stack-management"
    }
  }
}
```
# heartbeat always create our index template
PUT heartbeat-7-management*/_settings 
{
  "index": {
    "lifecycle": {
      "name": "heartbeat-7-management"
    }
  }
}
```
```
PUT _index_template/ingress-nginx-management
{
  "index_patterns": ["ingress-nginx-management*"],
  "template": {
    "settings": {
      "number_of_shards": 1,
      "index.lifecycle.name": "ingress-nginx-management"
    },
    "mappings": {
      "_source": {
        "enabled": true
      }
    }
  }
}
PUT ingress-nginx-management*/_settings 
{
  "index": {
    "lifecycle": {
      "name": "ingress-nginx-management"
    }
  }
}
```
```
PUT _index_template/kube-system-management
{
  "index_patterns": ["kube-system-management*"],
  "template": {
    "settings": {
      "number_of_shards": 1,
      "index.lifecycle.name": "kube-system-management"
    },
    "mappings": {
      "_source": {
        "enabled": true
      }
    }
  }
}
PUT kube-system-management*/_settings 
{
  "index": {
    "lifecycle": {
      "name": "kube-system-management"
    }
  }
}
```
```
PUT _index_template/cattle-system
{
  "index_patterns": ["cattle-system*"],
  "template": {
    "settings": {
      "number_of_shards": 1,
      "index.lifecycle.name": "cattle-system"
    },
    "mappings": {
      "_source": {
        "enabled": true
      }
    }
  }
}
PUT cattle-system*/_settings 
{
  "index": {
    "lifecycle": {
      "name": "kube-system-management"
    }
  }
}
```
```
PUT _index_template/collector-snmp
{
  "index_patterns": ["collector-snmp*"],
  "template": {
    "settings": {
      "number_of_shards": 1,
      "index.lifecycle.name": "collector-snmp"
    },
    "mappings": {
      "_source": {
        "enabled": true
      }
    }
  }
}
PUT collector-snmp*/_settings 
{
  "index": {
    "lifecycle": {
      "name": "collector-snmp"
    }
  }
}
```