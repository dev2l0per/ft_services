<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'juyang' );

/** MySQL database password */
define( 'DB_PASSWORD', 'juyang' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '1D6vRb,Nn`1}ORq.f{rWqfs|rdM_UcnQ+e_z|G5@ks#CFc1mqyvdavH]HV=;n+GZ');
define('SECURE_AUTH_KEY',  'T|sLB`ZQ5cE~UMJoBH]sKOi28ZKXyVA/FiI+ye|q6LrOW7&GMY +-~t`A?QCmHj$');
define('LOGGED_IN_KEY',    'w8NC[~`Yn;n+L^g &IYD$2=-Z:D&P@HsfDlbI@Dl}G|5?QDZICxTo@5^uJApb4/U');
define('NONCE_KEY',        'NO.S-2!LZ(E#%u3tA^*&$PH|;Gq(9_z(l[UM5dn21+4:ym XSkI6U+G6TubCD@WX');
define('AUTH_SALT',        '-v-(u7!?KDSj9@IPJWW3?9^6*y]R`|a-mQ7h{d=:1;g{h-CV;{%G+-Dj5Sy|RN G');
define('SECURE_AUTH_SALT', '5RU0${H^f60Q8<qwc&:`qx;|r/)kZ@&Qo2>S[cvvA/4;4%oaV c3mVdq.=; M-FE');
define('LOGGED_IN_SALT',   '#| iw|x:}zsV789NSR:l9@F>iu.E!0X0BFe).8$0{*U04.P;*EQef%+BL&iiT`gZ');
define('NONCE_SALT',       'Xk^}e`8%||FQ+6=RE71zh@NDA8|YQmb.J^ 7l~B35[4wqosd-q,`3K%|ks|@3*,Q');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
