function sum (){
	[int]$opr1 = Read-Host "Input First val"
	[int]$opr2 = Read-Host "Input Second val"
	"Sum of $opr1 & $opr2 : $($opr1+$opr2)"
}

function math-menu {
	while($true){
		"----------------------"
		"1. sum"
		"2. matrix (x)"
		"3. "
		"x. Exit"
		"----------------------"
		
		$cho = Read-Host "Choose an option"

		#clear
		if($cho -eq "1"){
			sum
		}elseif($cho -eq "2"){
			"opt2"
		}elseif($cho -eq "3"){
			"opt3"
		}elseif($cho -eq "x"){
			"optX"
			break
		}else{
			"elselee"
		}
	}
}

function manager-software {
    Write-Host "manager-software function called (placeholder)"
    # Future implementation for software management
}