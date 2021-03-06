const connection = require('../db-connection');

const findMany = () => {
  const sql = 'SELECT * FROM products_images';
  return connection.promise().query(sql);
};

const findOneById = (id) => {
  const sql = 'SELECT * FROM products_images WHERE id=?';
  return connection.promise().query(sql, [id]);
};

const findManyById = (ids) => {
  let sql = 'SELECT * FROM products_images WHERE id=?';
  for (let i = 1; i < ids.length; i++) {
    sql += ' OR id=?';
  }
  return connection.promise().query(sql, [...ids]);
};

const createOne = (productsImages) => {
  const sql = 'INSERT INTO products_images SET ?';
  return connection.promise().query(sql, [productsImages]);
};

const createMany = (productsImages) => {
  const sql = 'INSERT INTO products_images (link, alt) VALUES ?';
  return connection.promise().query(sql, [productsImages]);
};

const updateOne = (productsImages, id) => {
  const sql = 'UPDATE products_images SET ? WHERE id=?';
  return connection.promise().query(sql, [productsImages, id]);
};

const deleteOne = (id) => {
  const sql = 'DELETE FROM products_images WHERE id=?';
  return connection.promise().query(sql, [id]);
};

const findImagesPerProductId = (id) => {
  const sql =
    'SELECT p.id, i.* FROM products p JOIN represents r ON r.product_id=p.id RIGHT JOIN products_images i ON i.id=r.product_images_id WHERE p.id=?';
  return connection.promise().query(sql, [id]);
};

module.exports = {
  findMany,
  findOneById,
  findManyById,
  createOne,
  createMany,
  updateOne,
  deleteOne,
  findImagesPerProductId,
};
