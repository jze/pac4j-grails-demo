package login

class User {
    String firstName
    String lastName
    String email
    String provider

    static constraints = {
        email blank:false, email:true
        firstName blank:false
        lastName blank:false
        provider blank:false
    }
}
