import Versus from 0xf8d6e0586b0a20c7

//this transaction is run as the account that will host and own the marketplace to set up the 
//versusAdmin client and create the empty content and art collection
transaction() {

    prepare(account: AuthAccount) {
        
        //create versus admin client
        account.save(<- Versus.createAdminClient(), to:Versus.VersusAdminStoragePath)
        account.link<&{Versus.AdminPublic}>(Versus.VersusAdminPublicPath, target: Versus.VersusAdminStoragePath)


    }
}
