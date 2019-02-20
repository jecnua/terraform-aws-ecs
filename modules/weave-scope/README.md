# Module to install weave-scope on an ECS cluster

## Parameters

You can find them [here](params.md)

## Example

The monitoring tool will be installed as a DAEMON unless you specify a list
of at least one EC2 server. In this second case the number of container
will be equal to the number of IDs passed.

    variable "instances_id" {
      default = ["i-xxx", "i-yyy"]
    }
