import CryptoPoops from 0x01
import NonFungibleToken from 0x02

transaction(recipient: Address) {

    prepare(acct: AuthAccount) {
        let nftminter = acct.borrow<&CryptoPoops.Minter>(from: /storage/Minter)!

        let publicReference = getAccount(recipient).getCapability(/public/Collection)
                            .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                            ?? panic("hey this account doesnt have a collection")

        publicReference.deposit(token: <- nftminter.createNFT(name: "ethereum", favouriteFood: "Pizza", luckyNumber: 7))
        publicReference.deposit(token : <- nftminter.createNFT(name: "solana", favouriteFood: "Burger", luckyNumber: 3))
        publicReference.deposit(token: <- nftminter.createNFT(name: "polygon", favouriteFood: "Ice Cream", luckyNumber: 5))
        publicReference.deposit(token: <- nftminter.createNFT(name: "bitcoin", favouriteFood: "Ice Cream", luckyNumber: 5))
        publicReference.deposit(token: <- nftminter.createNFT(name: "dogecoin", favouriteFood: "Ice Cream", luckyNumber: 5))
    }

    execute {
        log("STORED newly minted nft into collection")
    }
}
