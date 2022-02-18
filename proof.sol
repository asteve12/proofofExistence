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

    function storeFiles(string memory fileshash,string memory owner)public ensureOnlyOneFile(fileshash) {
        files[fileshash] = fileDetails(owner,block.timestamp);
    }
    function getFiles(string memory filehash)public returns(uint,string memory){

        return(files[filehash].timestamp,files[filehash].owner);

    }

}