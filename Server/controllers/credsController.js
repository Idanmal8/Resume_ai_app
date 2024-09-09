const Creds = require('../models/creds');

// Create a new Creds entry
exports.createCreds = async (req, res) => {
  try {
    const creds = await Creds.create(req.body);
    res.status(201).json(creds);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Get all Creds entries
exports.getAllCreds = async (req, res) => {
  try {
    const creds = await Creds.findAll();
    res.status(200).json(creds);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Get a specific Creds entry
exports.getCredsById = async (req, res) => {
  try {
    const creds = await Creds.findByPk(req.params.id);
    if (creds) {
      res.status(200).json(creds);
    } else {
      res.status(404).json({ error: 'Creds not found' });
    }
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Update a Creds entry
exports.updateCreds = async (req, res) => {
  try {
    const creds = await Creds.update(req.body, {
      where: { uid: req.params.id },
    });
    res.status(200).json(creds);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Delete a Creds entry
exports.deleteCreds = async (req, res) => {
  try {
    await Creds.destroy({ where: { uid: req.params.id } });
    res.status(204).send();
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};