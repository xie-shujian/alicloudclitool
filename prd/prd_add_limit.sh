#! /bin/bash

# crontab
#*/5 * * * * /xxxxxx/prd/prd_add_limit.sh /xxxxxx/prd/prd_data_828.txt

#1 0 1 9 * /xxxxxx/prd/prd_add_limit.sh /xxxxxx/prd/prd_data_91.txt

#1 0 6 9 * /xxxxxx/prd/prd_add_limit.sh /xxxxxx/prd/prd_data_96.txt

#config="/xxxxxx/prd/prd_data.txt"
config=$1
log="/xxxxxx/prd/prd_apigw.log"
region="cn-beijing"
stage="RELEASE"
endpoint="apigateway-vpc.cn-beijing.aliyuncs.com"
group_prd="xxxxx"

echo $(date) "add plugins" >> $log
while read api_name api_id plugin_name plugin_id; do
  echo "add $plugin_name to $api_name " >> $log
  /usr/local/bin/aliyun cloudapi AttachPlugin --ApiId $api_id --PluginId $plugin_id --GroupId $group_prd --region $region --StageName $stage --endpoint $endpoint >> $log
done < $config