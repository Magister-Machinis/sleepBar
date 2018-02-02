<#
	just a little function to add a progress bar on top of the sleep command
#>
function sleepBar
{
    param(
	[int]$hour=0,
	[int]$min=0,
	[int]$sec=0,
	[int]$mil=0
	)
	if($mil -ne 0)
	{
		Start-Sleep -Milliseconds $mil
	}
	$timer = ($hour*60*60)+($min*60)+$sec
    for($count = 0; $count -lt $timer; $count++)
    {
        $percent = ($count / $timer) * 100
        write-progress -id 1 -activity "Sleeping: " -status "=][=  $count" -percentcomplete $percent -secondsremaining ($timer - $count)
        start-sleep -s 1
    }
    Write-Progress -id 1 -Completed -activity ""
}