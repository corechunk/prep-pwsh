Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# ------- File : src/module1.ps1 ------- 

function printer ($arg1){
	write-host "$arg1"
}

printer aka

# ------- File : src/main.ps1 ------- 

function main {
	while($true){
		"----------------------"
		"1. akame"
		"2. ga"
		"3. kill"
		"x. Exit"
		"----------------------"
		
		$cho = Read-Host "Choose an option"

		if($cho -eq "1"){
			"opt1"
		}elseif($cho -eq "2"){
			"opt2"
		}elseif($cho -eq "x"){
			"optX"
			break
		}else{
			"elselee"
		}
	}
};main

# -------------- 

