spark-cookbook
=======================

This cookbook helps you to install Apache Spark.

Requirements
------------

#### packages
- `java` - spark runs on JVM so java is required.

Attributes
----------

#### spark::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['spark']['version']</tt></td>
    <td>String</td>
    <td>Spark version</td>
    <td><tt>0.9.1</tt></td>
  </tr>
  <tr>
    <td><tt>['spark']['install_dir']</tt></td>
    <td>String</td>
    <td>Where you want to install spark to</td>
    <td><tt>/usr/local</tt></td>
  </tr>
  <tr>
    <td><tt>['spark']['user']</tt></td>
    <td>String</td>
    <td>User installs/runs spark process</td>
    <td><tt>spark</tt></td>
  </tr>
  <tr>
    <td><tt>['spark']['group']</tt></td>
    <td>String</td>
    <td>Group installs/runs spark process</td>
    <td><tt>spark</tt></td>
  </tr>
  <tr>
    <td><tt>['spark']['sbt_version']</tt></td>
    <td>String</td>
    <td>Version of sbt when you when to build from source</td>
    <td><tt>0.13.2</tt></td>
  </tr>
</table>

Usage
-----
#### spark::build_from_source

Just include `spark::build_from_source` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[spark::build_from_source]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Tien Nguyen
