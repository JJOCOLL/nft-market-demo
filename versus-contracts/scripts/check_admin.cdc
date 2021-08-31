//mainnnet
import Versus from 0xf8d6e0586b0a20c7

/*
  This script will check if an address has created an admin client
 */
pub fun main(account:Address) : Bool {
    return getAccount(account).getCapability<&{Versus.AdminPublic}>(Versus.VersusAdminPublicPath).check()
}
 
 
 
