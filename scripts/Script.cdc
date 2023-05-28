import CryptoPoops from 0x01
import NonFungibleToken from 0x02
pub fun main(account: Address,id:UInt64) : String{
  let publicReference = getAccount(account).getCapability(/public/Collection)
                            .borrow<&CryptoPoops.Collection{CryptoPoops.MyCollectionPublic}>()
                            ?? panic("hey this account doesnt have a collection")
  log(publicReference.borrowAuthNFT(id: id).name)
  log(publicReference.borrowAuthNFT(id: id).favouriteFood)
  log(publicReference.borrowAuthNFT(id: id).luckyNumber)
  return publicReference.borrowAuthNFT(id: id).favouriteFood
}
