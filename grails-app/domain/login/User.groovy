package login

class User {
    String name
    String email

    static constraints = {
        email email:true
    }
}
