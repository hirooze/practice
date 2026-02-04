use clap::{Arg, Command};
use std::env;

use msr::task_main::{perform_replace_main, add_pattern_main, del_pattern_main, clear_patterns_main, list_patterns_main, export_patterns_main, import_patterns_main, show_help_main, show_version_main};

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
        perform_replace_main(input, &pattern_file);
    } else if let Some(sub_matches) = matches.subcommand() {
        match sub_matches {
            ("add", sub_m) => {
                let before = sub_m.get_one::<String>("before").unwrap();
                let after = sub_m.get_one::<String>("after").unwrap();
                add_pattern_main(&pattern_file, before, after);
            }
            ("del", sub_m) => {
                let before = sub_m.get_one::<String>("before").unwrap();
                del_pattern_main(&pattern_file, before);
            }
            ("clear", _) => clear_patterns_main(&pattern_file),
            ("list", _) => list_patterns_main(&pattern_file),
            ("export", sub_m) => {
                let file = sub_m.get_one::<String>("file").unwrap();
                export_patterns_main(&pattern_file, file);
            }
            ("import", sub_m) => {
                let file = sub_m.get_one::<String>("file").unwrap();
                import_patterns_main(&pattern_file, file);
            }
            ("help", _) => show_help_main(),
            ("version", _) => show_version_main(),
            _ => {}
        }
    } else {
        show_help_main();
    }
}