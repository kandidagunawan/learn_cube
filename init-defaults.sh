#!/usr/bin/env sh

CLICKHOUSE_DB="sales_db";
CLICKHOUSE_USER="default";
CLICKHOUSE_PASSWORD="";

cat <<EOT >> /etc/clickhouse-server/users.d/user.xml
<yandex>
  <!-- Docs: <https://clickhouse.tech/docs/en/operations/settings/settings_users/> -->
  <users>
    <default>
      <profile>default</profile>
      <networks>
        <ip>::/0</ip>
      </networks>
      <password></password>
      <quota>default</quota>
    </default>
  </users>
</yandex>
EOT
#cat /etc/clickhouse-server/users.d/user.xml;

clickhouse-client --query "CREATE DATABASE IF NOT EXISTS sales_db";