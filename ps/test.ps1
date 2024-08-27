$region="cn-beijing"
$stage="RELEASE"
$group_qa="xxxxx"
$group_poc="xxxx"
$group_prd="xxxxx"


$myfile = ".\poc_data.txt"
$data = Import-Csv -Path $myfile -Delimiter "`t" -Header 'api_name', 'api_id','plugin_name','plugin_id'

$data | ForEach-Object {
    $api_name = $_.api_name
    $api_id = $_.api_id
    $plugin_name = $_.plugin_name
    $plugin_id = $_.plugin_id
    echo $api_name
    echo $api_id
    echo $plugin_name
    echo $plugin_id

    aliyun cloudapi AttachPlugin  --ApiId $api_id --PluginId $plugin_id  --GroupId $group_poc --region $region --StageName $stage 
}

