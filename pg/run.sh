#!/bin/bash
#
# Copyright 2022 mbo.dev
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

HostName=$(hostname)
HostIP=$IP
if [ "" == "$HostIP" ]; then
  HostIP=$(hostname --ip-address | sed 's/.* //')
fi
Network=$(echo "$HostIP" | cut -d"." -f1).0.0.0/8
echo "start patroni on ${HostName} $HostIP ($Network)"
sed "s@%%%HostIP%%%@${HostIP}@g" /var/lib/postgresql/patroni_template.yml > /var/lib/postgresql/patroni.yml
sed -i "s@%%%HostName%%%@${HostName}@g" /var/lib/postgresql/patroni.yml
sed -i "s@%%%Network%%%@${Network}@g" /var/lib/postgresql/patroni.yml
/usr/local/bin/patroni /var/lib/postgresql/patroni.yml