import FungibleToken from 0xee82856bf20e2aa6
import Art from 0xf8d6e0586b0a20c7



/*
  This script will check an address and print out its FT, NFT and Versus resources
 */
pub fun main(address:Address) : { String: String}{
    // get the accounts' public address objects
    let account = getAccount(address)
    let art= Art.getArt(address: address)

	let dict : { String: String} = {}
	for a in art {
		dict[a.cacheKey] = a.metadata.name.concat("-").concat(a.metadata.artist)
	}
    
    return dict

}
