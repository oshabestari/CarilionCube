copy nul > _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dim_columns.sql >> _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dim_error_configs.sql >> _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dim_hierarchies.sql >> _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dim_key_columns.sql >> _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dim_levels.sql >> _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dim_tables.sql >> _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dsv_columns.sql >> _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dsv_foreign_keys.sql >> _output.txt
sqlcmd -S localhost\sql2016 -E -d CubeMetadata -i dsv_tables.sql >> _output.txt
