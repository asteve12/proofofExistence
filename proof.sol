pragma solidity ^0.8.4;



contract ProofOfExistence{

struct fileDetails{
        string owner;
        uint timestamp;
    }

    mapping(string =>fileDetails) files;

  modifier ensureOnlyOneFile(string memory filehash){
      require(files[filehash].timestamp == 0,"the file already existed");
      _;
      
  }
  modifier ensureFilesExist(string memory filehash){
      require(files[filehash].owner !=0,"The file you are requesting for has not being stored on the blockchain");
      _;
  }

    function storeFiles(string memory fileshash,string memory owner)public ensureOnlyOneFile(fileshash) {
        files[fileshash] = fileDetails(owner,block.timestamp);
    }
    function getFiles(string memory filehash)public ensureFilesExist(filehash) returns(uint,string memory){

        return(files[filehash].timestamp,files[filehash].owner);

    }

}