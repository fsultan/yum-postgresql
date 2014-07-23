# yum-postgresql-cookbook

Chef Cookbook to manage the postgresql PGDG repositories

## Supported Platforms

* CentOS >= 5

## Supported PostgreSQL versions

* PostgreSQL >= 8.4

Not all versions below 9.2 are availible on all platforms.
For a current list see: http://yum.postgresql.org/

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['yum-postgresql']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### yum-postgresql::default

Include `yum-postgresql` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[yum-postgresql::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Fahd Sultan (fahdsultan@gmail.com)
