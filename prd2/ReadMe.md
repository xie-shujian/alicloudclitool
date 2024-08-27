输入数据格式是

api name，api id，plugin name，plugin id 用制表符分割开，没有表头

运行的时候，数据文件作为参数

test.sh data.txt

centos定时任务

crontab -e

*/5 * * * * prd_add_limit.sh prd_data_828.txt