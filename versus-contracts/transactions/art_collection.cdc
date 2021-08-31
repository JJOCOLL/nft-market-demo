
import NonFungibleToken from 0xf8d6e0586b0a20c7
import Art from 0xf8d6e0586b0a20c7

//This transaction will prepare the art collection
transaction() {
    prepare(account: AuthAccount) {
        account.save<@NonFungibleToken.Collection>(<- Art.createEmptyCollection(), to: Art.CollectionStoragePath)
        account.link<&{Art.CollectionPublic}>(Art.CollectionPublicPath, target: Art.CollectionStoragePath)
    }

}

