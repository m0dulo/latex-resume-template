\NeedsTeXFormat{LaTeX2e}
% 定义基于 article 的 'resume' 类 - 初始版本
\ProvidesClass{resume}[2025]
\LoadClass[11pt]{article}

% ============================================================================
% 所需包导入 (基础)
% ============================================================================
\RequirePackage{xltxtra}        % 提供 XeLaTeX 特有功能
\RequirePackage{xifthen}        % 提供条件命令 (例如 \isempty)
\RequirePackage{xcolor}         % 提供颜色定义 (稍后使用)
\RequirePackage{fontspec}       % 用于字体选择
\RequirePackage{titlesec}       % 用于自定义章节标题格式
% \RequirePackage{enumitem}       % (稍后添加) 用于自定义列表环境
% \RequirePackage{hyperref}       % (稍后添加) 用于生成超链接
% \RequirePackage{fontawesome}    % (稍后添加) 提供图标支持

% ============================================================================
% 基本设置
% ============================================================================
\setlength{\parindent}{0pt} % 全局禁用段落缩进
% \definecolor{resumeblue}{RGB}{0, 86, 179} % 

% 字体设置 (基础西文)
\setmainfont[
  Path = fonts/Main/ ,
  Extension = .otf ,
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  SmallCapsFont = Fontin-SmallCaps
]{texgyretermes}

% 页面边距设置
\RequirePackage[a4paper, left=0.558in, right=0.558in, top=0.218in, bottom=0.218in, nohead]{geometry}

% 列表环境配置 (稍后添加)
% \setlist{noitemsep}
% \setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
% \setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}

% ============================================================================
% 标题与段落格式 (基础)
% ============================================================================
% 自定义 section 格式 (无颜色，无图标，无横线)
\titleformat{\section}
  {\Large\scshape\raggedright} % 移除颜色
  {}{0em}{} % 无额外内容
\titlespacing*{\section}{0cm}{*1}{*1}

% 自定义 subsection 格式
\titleformat{\subsection}
  {\large\raggedright}{}{0em}{}
\titlespacing*{\subsection}{0cm}{*1}{*0.5}

% ============================================================================
% 实用命令
% ============================================================================
% 姓名命令
\newcommand{\name}[1]{%
  \centerline{\huge\textbf{#1}}%
  \vspace{2ex}%
}

% \newcommand{\contactInfo}[6]{...}
% \newcommand{\objective}[2]{...}
% \newcommand{\datedsubsection}[3]{...}
% \newcommand{\datedline}[2]{...}

\endinput % End of class file