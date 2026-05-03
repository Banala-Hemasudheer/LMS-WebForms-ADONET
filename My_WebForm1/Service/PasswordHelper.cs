using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;

namespace My_WebForm1.Service
{
    using System;                                     // Basic system functions (Convert, etc.)
    using System.Security.Cryptography;                // Cryptography classes (RNG, PBKDF2)

    public static class PasswordHelper                 // Static helper class for password operations
    {
        private const int SaltSize = 16;               // Size of salt in bytes (128 bits)
        private const int HashSize = 32;               // Size of hash in bytes (256 bits)
        private const int Iterations = 10000;          // Number of PBKDF2 iterations (work factor)

        // 🔐 Create password hash → returns "salt:hash"
        public static string HashPassword(string password) // Method to hash a plain password
        {
            byte[] salt = new byte[SaltSize];              // Allocate byte array for salt

            using (var rng = new RNGCryptoServiceProvider()) // Create secure random number generator
            {
                rng.GetBytes(salt);                        // Fill salt array with random bytes
            }                                              // Dispose RNG

            byte[] hash;                                   // Declare array to store hash result

            using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, Iterations)) // Create PBKDF2 instance
            {
                hash = pbkdf2.GetBytes(HashSize);          // Generate hash bytes from password+salt
            }                                              // Dispose PBKDF2 instance

            string saltBase64 = Convert.ToBase64String(salt); // Convert salt bytes to Base64 string
            string hashBase64 = Convert.ToBase64String(hash); // Convert hash bytes to Base64 string

            return saltBase64 + ":" + hashBase64;          // Combine salt and hash with ":" separator
        }

        // 🔍 Verify password against stored "salt:hash"
        public static bool VerifyPassword(string password, string storedValue) // Method to verify password
        {
            var parts = storedValue.Split(':');            // Split stored value into salt and hash parts

            if (parts.Length != 2) return false;           // If format is invalid, fail immediately

            byte[] salt = Convert.FromBase64String(parts[0]); // Decode salt from Base64
            byte[] storedHash = Convert.FromBase64String(parts[1]); // Decode stored hash from Base64

            byte[] computedHash;                           // Declare array for newly computed hash

            using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, Iterations)) // Recreate PBKDF2 instance
            {
                computedHash = pbkdf2.GetBytes(HashSize);  // Compute hash for entered password
            }                                              // Dispose PBKDF2 instance

            // ✅ The "Simple Way": Convert both to Hex strings and compare
            // BitConverter.ToString creates a string like "A1-B2-C3..."
            string computedHex = BitConverter.ToString(computedHash); // Convert computed bytes to hex string
            string storedHex = BitConverter.ToString(storedHash);     // Convert stored bytes to hex string

            return computedHex == storedHex;               // Return result of simple string comparison
        }
    }
}