import Array "mo:base/Array";

actor UserManager {
    // Kullanıcıyı temsil eden bir kayıt tipi
    public type User = {
        id: Nat;
        name: Text;
        email: Text;
    };

    // Kullanıcıları depolamak için bir dizi
    var users: [User] = [];
    var nextId: Nat = 1;

    // Yeni bir kullanıcı ekler
    public func createUser(name: Text, email: Text): async User {
        let newUser: User = {
            id = nextId;
            name = name;
            email = email;
        };
        users := Array.append(users, [newUser]);
        nextId += 1;
        return newUser;
    };

    // Tüm kullanıcıları döndürür
    public query func readUsers(): async [User] {
        return users;
    };

    // Belirli bir kullanıcıyı günceller
    public func updateUser(id: Nat, name: Text, email: Text): async ?User {
        var updatedUser: ?User = null;
        users := Array.map<User, User>(users, func (user) {
            if (user.id == id) {
                updatedUser := ?{ id = id; name = name; email = email };
                return switch (updatedUser) {
                    case (?u) u;
                    case null user;
                };
            } else {
                return user;
            }
        });
        return updatedUser;
    };

    // Belirli bir kullanıcıyı siler
    public func deleteUser(id: Nat): async Bool {
        let initialLength = Array.size(users);
        users := Array.filter<User>(users, func (user) {
            user.id != id
        });
        return Array.size(users) < initialLength;
    };
};
