use std::fs;
use std::path::Path;

pub fn clear_patterns() {
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    fs::write(&pattern_file, "").unwrap();
    println!("パターンをクリアしました");
}