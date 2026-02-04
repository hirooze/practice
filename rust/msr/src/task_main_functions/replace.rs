use std::path::Path;

use super::utils::load_patterns;

pub fn replace_with_patterns(text: &str, pattern_file: &Path) -> String {
    let patterns = load_patterns(pattern_file);
    let mut result = text.to_string();
    for (before, after) in patterns {
        result = result.replace(&before, &after);
    }
    result
}