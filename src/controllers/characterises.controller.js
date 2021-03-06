const Joi = require('joi');
const { findMany, findOneById, createOne, updateOne, deleteOne } = require('../models/characterises.model');

const getAllCharacterises = (req, res) => {
  findMany()
    .then((results) => {
      const characterises = results[0];
      res.json(characterises);
    })
    .catch((err) => {
      res.status(500).send(err.message);
    });
};

const getOneCharacterisesById = (req, res) => {
  let id;
  if (req.characterisesId) {
    id = req.characterisesId;
  } else {
    id = req.params.id;
  }

  findOneById(id)
    .then(([Characterises]) => {
      if (Characterises.length === 0) {
        res.status(404).send('Characterises not found');
      } else {
        res.json(Characterises[0]);
      }
    })

    .catch((err) => {
      res.status(500).send(err.message);
    });
};

const createOneCharacterises = (req, res, next) => {
  const { product_id, size_id, gender_id } = req.body;
  const { error } = Joi.object({
    product_id: Joi.number().integer(),
    size_id: Joi.number().integer(),
    gender_id: Joi.number().integer(),
  }).validate({ product_id, size_id, gender_id }, { abortEarly: false });
  if (error) {
    res.status(422).json({ validationErrors: error.details });
  } else {
    createOne({ product_id, size_id, gender_id })
      .then(([results]) => {
        res.status(201);
        req.characterisesId = results.insertId;
        next();
      })
      .catch((err) => {
        res.status(500).send(err.message);
      });
  }
};

const updateOneCharacterises = (req, res, next) => {
  const { product_id, size_id, gender_id } = req.body;
  const { error } = Joi.object({
    product_id: Joi.number().integer(),
    size_id: Joi.number().integer(),
    gender_id: Joi.number().integer(),
  })
    .min(1)
    .validate({ product_id, size_id, gender_id }, { abortEarly: false });
  if (error) {
    res.status(422).json({ validationErrors: error.details });
  } else {
    updateOne(req.body, req.params.id)
      .then(([results]) => {
        if (results.affectedRows === 0) {
          res.status(404).send('Characterises not found');
        } else {
          next();
        }
      })
      .catch((err) => {
        res.status(500).send(err.message);
      });
  }
};

const deleteOneCharacterises = (req, res) => {
  deleteOne(req.params.id)
    .then(([results]) => {
      if (results.affectedRows === 0) {
        res.status(404).send('Characterises not found');
      } else {
        res.sendStatus(204);
      }
    })
    .catch((err) => {
      res.status(500).send(err.message);
    });
};

module.exports = {
  getAllCharacterises,
  getOneCharacterisesById,
  createOneCharacterises,
  updateOneCharacterises,
  deleteOneCharacterises,
};
