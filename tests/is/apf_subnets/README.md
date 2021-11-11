This test should fail as below... the script is inteded to fail as below:
```
    "Result": {
        "errors": [
            {
                "code": "conflict_field",
                "message": "Cannot allocate subnet space - No suitable space in address pool(s)"
            }
        ],
        "trace": "271bf76b-26df-4be7-9c92-e0f8bf10a793"
    },
```

The total number of IPv4 addresses required. Must be a power of 2. The VPC must have a default address prefix in the specified zone, and that prefix must have a free CIDR range with at least this number of addresses.
