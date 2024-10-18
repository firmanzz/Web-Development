const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');
const User = require('../models/User');
const transporter = require('../config/mailer');
const { sendVerificationCode } = require('../utils/nodemailer');

// Fungsi untuk menghasilkan kode verifikasi 6 digit
const generateVerificationCode = () => {
  return crypto.randomInt(100000, 999999).toString();
};

// Registrasi user dengan verifikasi email
exports.registerUser = async (req, res) => {
  const { name, email, password } = req.body;

  try {
    let user = await User.findOne({ where: { email } });
    if (user) {
      return res.status(400).json({ message: 'Email already registered' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    const verificationCode = generateVerificationCode(); // Buat kode verifikasi

    // Simpan user dengan isVerified = false
    user = await User.create({
      name,
      email,
      password: hashedPassword,
      verificationCode,
      isVerified: false,
    });

    // Kirim email verifikasi
    const mailOptions = {
      from: process.env.GMAIL_USER,
      to: email,
      subject: 'Verify Your Email',
      text: `Your verification code is: ${verificationCode}`,
    };

    await transporter.sendMail(mailOptions);

    res.status(201).json({ message: 'User registered. Please check your email for the verification code.' });
  } catch (error) {
    console.error('Register Error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

// Verifikasi kode dari email
// Verifikasi email dan kode verifikasi
exports.verifyEmail = async (req, res) => {
  const { email, code } = req.body;

  try {
    const user = await User.findOne({ where: { email } });
    console.log('User Found:', user); // Debugging

    if (!user) {
      return res.status(400).json({ message: 'User not found' });
    }

    if (user.isVerified) {
      return res.status(400).json({ message: 'Email already verified' });
    }

    console.log(`Expected Code: ${user.verificationCode}, Received: ${code}`); // Debugging

    if (user.verificationCode !== code) {
      return res.status(400).json({ message: 'Invalid verification code' });
    }

    user.isVerified = true;
    user.verificationCode = null;
    await user.save();

    res.status(200).json({ message: 'Email verified successfully' });
  } catch (error) {
    console.error('Verification Error:', error); // Debugging
    res.status(500).json({ message: 'Server error' });
  }
};

// Login User tanpa validasi percobaan gagal
exports.loginUser = async (req, res) => {
  const { email, password } = req.body;
  console.log('Login Attempt:', email);

  try {
    const user = await User.findOne({ where: { email } });

    if (!user) {
      return res.status(400).json({ message: 'User not found' });
    }

    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ message: 'Invalid credentials' });
    }

    const token = jwt.sign(
      { id: user.id, name: user.name, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    res.json({ token , data: { id: user.id, name: user.name, role: user.role }  });
  } catch (error) {
    console.error('Login Error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

// Forgot Password Handler
exports.forgotPassword = async (req, res) => {
  const { email, name } = req.body;

  try {
    const user = await User.findOne({ where: { email, name } });

    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    const verificationCode = Math.floor(100000 + Math.random() * 900000).toString();
    user.verificationCode = verificationCode;
    await user.save();

    await sendVerificationCode(email, verificationCode); // Kirim email dengan kode verifikasi
    res.json({ message: 'Verification code sent. Please check your email.' });
  } catch (error) {
    console.error('Forgot Password Error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

// Reset Password Handler
exports.resetPassword = async (req, res) => {
  const { email, code, newPassword } = req.body;

  try {
    const user = await User.findOne({ where: { email, verificationCode: code } });

    if (!user) {
      return res.status(400).json({ message: 'Invalid verification code' });
    }

    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(newPassword, salt);
    user.verificationCode = null; // Reset kode verifikasi
    await user.save();

    res.json({ message: 'Password reset successful' });
  } catch (error) {
    console.error('Reset Password Error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};
