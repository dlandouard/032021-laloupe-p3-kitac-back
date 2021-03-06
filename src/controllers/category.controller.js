const Joi = require('joi');
const { findMany, findOneById, createOne, updateOne, deleteOne, findProductsPerCategoryId } = require('../models/category.model');

const getAllCategory = (req, res) => {
  findMany()
    .then((results) => {
      const category = results[0];
      res.json(category);
    })
    .catch((err) => {
      res.status(500).send(err.message);
    });
};

const getOneCategoryById = (req, res) => {
  let id;
  if (req.categoryId) {
    id = req.categoryId;
  } else {
    id = req.params.id;
  }

  findOneById(id)
    .then(([Category]) => {
      if (Category.length === 0) {
        res.status(404).send('Category not found');
      } else {
        res.json(Category[0]);
      }
    })
    .catch((err) => {
      res.status(500).send(err.message);
    });
};

const createOneCategory = (req, res, next) => {
  const { name } = req.body;
  const { error } = Joi.object({
    name: Joi.string().max(100).required(),
  }).validate({ name }, { abortEarly: false });
  if (error) {
    res.status(422).json({ validationErrors: error.details });
  } else {
    createOne({ name })
      .then(([results]) => {
        req.categoryId = results.insertId;
        next();
      })
      .catch((err) => {
        res.status(500).send(err.message);
      });
  }
};

const updateOneCategory = (req, res, next) => {
  const { name } = req.body;
  const { error } = Joi.object({
    name: Joi.string().max(100),
  })
    .min(1)
    .validate({ name }, { abortEarly: false });
  if (error) {
    res.status(422).json({ validationErrors: error.details });
  } else {
    updateOne(req.body, req.params.id)
      .then(([results]) => {
        if (results.affectedRows === 0) {
          res.status(404).send('Category not found');
        } else {
          next();
        }
      })
      .catch((err) => {
        res.status(500).send(err.message);
      });
  }
};

const deleteOneCategory = (req, res) => {
  deleteOne(req.params.id)
    .then(([results]) => {
      if (results.affectedRows === 0) {
        res.status(404).send('Category not found');
      } else {
        res.sendStatus(204);
      }
    })
    .catch((err) => {
      res.status(500).send(err.message);
    });
};
// premier join
const getProductsByCategoryId = (req, res, next) => {
  let id;
  if (req.categoryId) {
    id = req.categoryId;
  } else {
    id = req.params.id;
  }

  findProductsPerCategoryId(id)
    .then(([Category]) => {
      if (Category.length === 0) {
        res.status(404).send('Category not found');
      } else {
        res.json(Category);
        next();
      }
    })
    .catch((err) => {
      res.status(500).send(err.message);
    });
};

module.exports = {
  getAllCategory,
  getOneCategoryById,
  createOneCategory,
  updateOneCategory,
  deleteOneCategory,
  getProductsByCategoryId,
};
