<?php

function InitialPassword() {
	 $characters = 'abcdf2ABCD34FGH5ghKLMjkmNPn89pqQRSTUrstVWXvwxyz6YZ7';
	 $characters_len = strlen($characters);
 	 $password = '';
 	 $password_len = 10;
 		for ($i = 0; $i < $password_len; $i++) {
      		$password .= $characters[rand(0, $characters_len - 1)];
 		}
 return $password;
}
echo $_POST['post_type_id'] . "  Hello";
$user_email  = $_POST['user_email'];
$user_password = InitialPassword();
$first_name = $_POST['first_name'];
$last_name  = $_POST['last_name'];
$address = $_POST['address'];
$city = $_POST['city'];
$zip = $_POST['zip'];
$country = $_POST['country'];
$phone = $_POST['phone'];
$status = FALSE;

//$user_id = $_POST['user_id'];
$post_id = $_POST['post_id'];
$post_date = $_POST['post_date'];
$post_type_id = -1; //FixMe: Grab it from frontend
$item_id = -1;  //FixMe:
$item_sub_id = -1; //FixMe:

$price = $_POST['price'];
$isOBO = -1;
$item_description = $_POST['item_description'];
$lost_found_date = date("Y/m/d");

//https://daveismyname.com/upload-multiple-files-with-a-single-input-with-html-5-and-php-bp
function post_image_upload($conn) {

	if(count($_FILES['upload']['name']) > 0){
	$post_image_path = "../post_image/";
		for($i=0; $i<count($_FILES['upload']['name']); $i++) {
	    	$tmpFilePath = $_FILES['upload']['tmp_name'][$i];
		    if($tmpFilePath != ""){
	    		$shortname = $_FILES['upload']['name'][$i];
	    		$file_path = $post_image_path . date('d-m-Y-H-i-s').'-'.$_FILES['upload']['name'][$i];
	 			if(move_uploaded_file($tmpFilePath, $file_path)) {
		    		$file_name = $_FILES['upload']['name'][$i];
					$file_size = $_FILES['upload']['size'][$i];
					//$file_type = $_FILES['upload']['type'][$i];
					$file_type = end(explode('.', $_FILES['upload']['type'][$i]));
		            $post_id   = $_POST['post_id'];
		            $sql = "INSERT INTO post_image (post_id, file_name, file_type, file_size, file_content)  ".
					"VALUES ('$post_id', '$file_name', '$file_type', '$file_size', '$file_path' );";
					$result = $conn->query($sql);

					if (!$result )
			     		throw new Exception($conn->error);    
	        
				}//end of if
	  		}//end of if
		}//end of for
	}//end of outer if

} //end of function

include '../db/dbConnect.php';
try{
	$conn->autocommit(FALSE);   //start a transaction
	$sql = "INSERT INTO user_master (user_email, user_password )  ".
	"VALUES ('$user_email', '$user_password');";
	$result = $conn->query($sql);

	if (!$result )
	     throw new Exception($conn->error);
	
	$sql = "INSERT INTO user_detail (user_email, first_name, last_name, address, city, zip, country, phone )  ".
	"VALUES ('$user_email', '$first_name', '$last_name', '$address', '$city', '$zip', '$country', '$phone' );";
	$result = $conn->query($sql);

	if (!$result )
	     throw new Exception($conn->error);

	 //FixMe:  post_detail, post_image[multiple files], universal_ids
    
    $sql = "INSERT INTO post_master (post_id, post_date, post_type_id, user_email, item_id, item_sub_id )  ".
	"VALUES ('$post_id', '$post_date', '$post_type_id', '$user_email', '$item_id', '$item_sub_id' );";
    
    $result = $conn->query($sql);

	if (!$result )
	     throw new Exception($conn->error);	

	 $sql = "INSERT INTO post_detail (post_id, price, isOBO, item_description, lost_found_date )  ".
	"VALUES ('$post_id', '$price', '$isOBO', '$item_description', '$lost_found_date' );";

	 $result = $conn->query($sql);

	if (!$result )
	     throw new Exception($conn->error);

	 $sql = "update universal_ids set post_id = '$post_id'; ";

	 $result = $conn->query($sql);

	if (!$result )
	     throw new Exception($conn->error);
    
    post_image_upload($conn);

	$conn->commit();
	$conn->autocommit(TRUE);  //ending a transaction
	echo "SUCCESS: POST SUBMISSION!" . "<br>";
	}catch(Exception $e) {
		$conn->rollback();
        $conn->autocommit(TRUE); // i.e., end transaction
        echo $e;
        echo "ERROR: POST SUBMISSION ";
}

?>