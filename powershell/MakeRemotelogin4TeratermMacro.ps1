#検索したいホストのMACアドレス（DHCPの際に役立つ）
$SearchMAC = "00-AA-BB-CC-DD-EE"
$RemoteIP = arp -a | findstr $SearchMAC |%{$($_.split(' '))[2]}
$Path     = Split-Path -Parent $MyInvocation.MyCommand.Path 
$FileName = $Path + "\" + "AutoRemotelogin_" + $RemoteIP + ".ttl"
$ConnectionInfo = @(
    @{
        To = "`'$RemoteIP`'";   #変更不要
        Id = "`'username`'";    #任意のユーザー名
        Pw = "`'password`'"     #任意のパスワード
    }
)
#新規ファイルの作成
New-Item -Path $FileName -ItemType File
$Username = "username = " + $ConnectionInfo[0].Id
$Hostname = "hostname = " + $ConnectionInfo[0].To 
$Password = "userpasswd = " + $ConnectionInfo[0].Pw
Add-Content -Path $FileName -Value $Username 
Add-Content -Path $FileName -Value $Hostname
Add-Content -Path $FileName -Value $Password
Add-Content -Path $FileName -Value "portnum = '22'"
Add-Content -Path $FileName -Value "msg = hostname" 
Add-Content -Path $FileName -Value "strconcat msg ':portnum /ssh /auth=password /user='" 
Add-Content -Path $FileName -Value "strconcat msg username" 
Add-Content -Path $FileName -Value "strconcat msg ' /passwd='" 
Add-Content -Path $FileName -Value "strconcat msg userpasswd"
Add-Content -Path $FileName -Value "strconcat msg inputstr"
Add-Content -Path $FileName -Value ""
Add-Content -Path $FileName -Value "connect msg"