pub mod utils;
pub mod replace;
pub mod operations;
pub mod display;

pub use utils::{load_patterns, save_patterns};
pub use replace::replace_with_patterns;
pub use operations::{add_pattern, del_pattern, clear_patterns, list_patterns, export_patterns, import_patterns};
pub use display::{show_help, show_version};