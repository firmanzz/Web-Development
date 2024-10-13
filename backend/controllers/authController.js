const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');
const User = require('../models/User');
const transporter = require('../config/mailer');

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

// Login user (cek status isVerified)
exports.loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ where: { email } });
    console.log('User Found:', user); // Debugging

    if (!user) {
      return res.status(400).json({ message: 'User not found' });
    }

    if (!user.isVerified) {
      return res.status(400).json({ message: 'Please verify your email first' });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    console.log('Password Match:', isMatch); // Debugging

    if (!isMatch) {
      return res.status(400).json({ message: 'Invalid credentials' });
    }

    const token = jwt.sign(
      { id: user.id, name: user.name, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    res.json({ token });
  } catch (error) {
    console.error('Login Error:', error); // Debugging
    res.status(500).json({ message: 'Server error' });
  }
};