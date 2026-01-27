use clap::{Arg, Command};
use std::env;
use std::process;

fn main() {
    // 設定ファイルのパスを取得
    let config_dir = env::current_dir().unwrap().join("etc");
    let pattern_file = config_dir.join("pattern.conf");

    let matches = Command::new("msr")
        .version("1.0")
        .author("User")
        .about("MultiStringReplace")
        .subcommand(
            Command::new("add")
                .about("パターンを追加")
                .arg(Arg::new("before").required(true))
                .arg(Arg::new("after").required(true)),
        )
        .subcommand(
            Command::new("del")
                .about("パターンを削除")
                .arg(Arg::new("before").required(true)),
        )
        .subcommand(Command::new("clear").about("パターンをクリア"))
        .subcommand(Command::new("list").about("パターンをリスト"))
        .subcommand(
            Command::new("export")
                .about("パターンをエクスポート")
                .arg(Arg::new("file").default_value("patterns.txt")),
        )
        .subcommand(
            Command::new("import")
                .about("パターンをインポート")
                .arg(Arg::new("file").required(true)),
        )
        .subcommand(Command::new("help").about("ヘルプを表示"))
        .subcommand(Command::new("version").about("バージョンを表示"))
        .arg(Arg::new("input").help("対象ファイルまたは文字列"))
        .get_matches();

    if let Some(input) = matches.get_one::<String>("input") {
        // 置換処理
        perform_replace(input, &pattern_file);
    } else if let Some(sub_matches) = matches.subcommand() {
        match sub_matches {
            ("add", sub_m) => {
                let before = sub_m.get_one::<String>("before").unwrap();
                let after = sub_m.get_one::<String>("after").unwrap();
                add_pattern(&pattern_file, before, after);
            }
            ("del", sub_m) => {
                let before = sub_m.get_one::<String>("before").unwrap();
                del_pattern(&pattern_file, before);
            }
            ("clear", _) => clear_patterns(&pattern_file),
            ("list", _) => list_patterns(&pattern_file),
            ("export", sub_m) => {
                let file = sub_m.get_one::<String>("file").unwrap();
                export_patterns(&pattern_file, file);
            }
            ("import", sub_m) => {
                let file = sub_m.get_one::<String>("file").unwrap();
                import_patterns(&pattern_file, file);
            }
            ("help", _) => show_help(),
            ("version", _) => show_version(),
            _ => {}
        }
    } else {
        show_help();
    }
}

fn perform_replace(input: &str, pattern_file: &std::path::Path) {
    // ファイルか文字列か判定
    if std::path::Path::new(input).exists() {
        // ファイルの場合
        let content = std::fs::read_to_string(input).unwrap();
        let replaced = replace_with_patterns(&content, pattern_file);
        println!("{}", replaced);
    } else {
        // 文字列の場合
        let replaced = replace_with_patterns(input, pattern_file);
        println!("{}", replaced);
    }
}

fn replace_with_patterns(text: &str, pattern_file: &std::path::Path) -> String {
    let patterns = load_patterns(pattern_file);
    let mut result = text.to_string();
    for (before, after) in patterns {
        result = result.replace(&before, &after);
    }
    result
}

fn load_patterns(pattern_file: &std::path::Path) -> Vec<(String, String)> {
    if !pattern_file.exists() {
        return vec![];
    }
    let content = std::fs::read_to_string(pattern_file).unwrap();
    content
        .lines()
        .filter(|line| !line.trim().is_empty() && !line.starts_with('#'))
        .map(|line| {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() == 2 {
                (parts[0].trim().to_string(), parts[1].trim().to_string())
            } else {
                ("".to_string(), "".to_string())
            }
        })
        .collect()
}

fn save_patterns(pattern_file: &std::path::Path, patterns: &[(String, String)]) {
    let mut lines: Vec<String> = patterns
        .iter()
        .map(|(b, a)| format!("{},{}", b, a))
        .collect();
    lines.sort();
    lines.dedup();
    let content = lines.join("\n");
    std::fs::write(pattern_file, content).unwrap();
}

fn add_pattern(pattern_file: &std::path::Path, before: &str, after: &str) {
    let mut patterns = load_patterns(pattern_file);
    patterns.push((before.to_string(), after.to_string()));
    save_patterns(pattern_file, &patterns);
    println!("パターンを追加しました: {} -> {}", before, after);
}

fn del_pattern(pattern_file: &std::path::Path, before: &str) {
    let mut patterns = load_patterns(pattern_file);
    patterns.retain(|(b, _)| b != before);
    save_patterns(pattern_file, &patterns);
    println!("パターンを削除しました: {}", before);
}

fn clear_patterns(pattern_file: &std::path::Path) {
    std::fs::write(pattern_file, "").unwrap();
    println!("パターンをクリアしました");
}

fn list_patterns(pattern_file: &std::path::Path) {
    let patterns = load_patterns(pattern_file);
    for (before, after) in patterns {
        println!("{} -> {}", before, after);
    }
}

fn export_patterns(pattern_file: &std::path::Path, file: &str) {
    let patterns = load_patterns(pattern_file);
    let content = patterns
        .iter()
        .map(|(b, a)| format!("{},{}", b, a))
        .collect::<Vec<_>>()
        .join("\n");
    std::fs::write(file, content).unwrap();
    println!("パターンを {} にエクスポートしました", file);
}

fn import_patterns(pattern_file: &std::path::Path, file: &str) {
    let import_content = std::fs::read_to_string(file).unwrap();
    let mut patterns = load_patterns(pattern_file);
    for line in import_content.lines() {
        if !line.trim().is_empty() && !line.starts_with('#') {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() == 2 {
                patterns.push((parts[0].trim().to_string(), parts[1].trim().to_string()));
            }
        }
    }
    save_patterns(pattern_file, &patterns);
    println!("パターンを {} からインポートしました", file);
}

fn show_help() {
    println!("{}", std::fs::read_to_string("lib/help.md").unwrap());
}

fn show_version() {
    println!("{}", std::fs::read_to_string("lib/version.md").unwrap());
}