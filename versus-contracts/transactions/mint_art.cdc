
import Versus from 0xf8d6e0586b0a20c7
import Art from 0xf8d6e0586b0a20c7

//mint an art and add it to a users collection
transaction(
    artist: Address,
    artistName: String, 
    artName: String, 
    description: String) {

    let artistCollection: Capability<&{Art.CollectionPublic}>
    let client: &Versus.Admin
		let content: String

    prepare(account: AuthAccount) {
        let path = /storage/upload
        self.content= account.load<String>(from: path) ?? panic("could not load content")
 
        self.client = account.borrow<&Versus.Admin>(from: Versus.VersusAdminStoragePath) ?? panic("could not load versus admin")
        self.artistCollection= getAccount(artist).getCapability<&{Art.CollectionPublic}>(Art.CollectionPublicPath)
    }

    execute {
        let art <-  self.client.mintArt(artist: artist, artistName: artistName, artName: artName, content:self.content, description: description)
        self.artistCollection.borrow()!.deposit(token: <- art)
    }
}

