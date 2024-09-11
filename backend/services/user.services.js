const UserModel = require('../models/user_models');
const bcrypt = require('bcrypt');

class UserService {
    static async registerUser(email, password, username) {
        try {
            const createUser = new UserModel({ email, password, username });
            return await createUser.save();
        } catch (err) {
            throw err;
        }
    }

    static async loginUser(email, password) {
        try {
            // Find the user by email
            const user = await UserModel.findOne({ email });
            if (!user) {
                throw new Error('User not found');
            }

            // Compare the provided password with the hashed password in the database
            const isMatch = await bcrypt.compare(password, user.password);
            if (!isMatch) {
                throw new Error('Invalid credentials');
            }

            // Return user data or token if needed
            return user; // Or return a JWT token or similar
        } catch (err) {
            throw err;
        }
    }
}

module.exports = UserService;
