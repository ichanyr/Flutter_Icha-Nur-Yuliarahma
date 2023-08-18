Pada materi ini saya mempelajari:
1. versioning
2. setting up: git init, clone, config
3. saving changes: git status, add, commit, diff, stash, ignore
4. inspecting repository and undoing: git log, checkout, reset
5. syncing: git remote, fetch, push, dan pull
6. branches
7. pull request
8. workflow collaboration

versioning: mengatur versi dari source code program
GIT: salah satu version control system populer yang digunakan para developer untuk mengembangkan software secara bersama-sama
GIT REPOSITORY: Folder dan Files, History

setiap kode yang kita rubah itu akan diwrap /dibungkus oleh suatu hal sehingga terdapat track yang brisikan perubahan yang terjadi, perubahan apa, oleh siapa, apa yang dirubah.

setting up
git init:

GIT DIFF: mengetahui bagaimana perubahan yang terjadi di file yang telah diedit.
putih -> sudah ada di repo github
merah -> kode sebelumnya
hijau -> perubahan kita yang ada di vscode yg blm diupdate di repo
GIT STASH : untuk menyimpan perubahan itu sehingga nanti dapat dikembalikan diperubahan yang diinginkan.

FILE .gitignore : berfungsi untuk memfilter mana saja yang boleh dan tidak dimasukkan ke repo.
kebanyakan penggunaannya kita tidak perlu memasukkan library2 yg bisa diinstal oleh partner. contoh node_modules/, json_packages/

INSPECTING REPOSITORY : memanajemen versi file yang kita buat.
git log --oneline: menampilkan setiap commit yang telah kita lakukan.
git checkout (kode): untuk mengembalikan kode sebelumnya sesuai keinginan dan sesuaian dengan kodenya.
git reset --soft:perubahannya terjadi nggak sebanyak yang hard (uncommit changes, changes are left staged(index).
git reset --hard:uncommit + unstage + delete changes, nothing left.

rekomendasinya gunakan soft, karena akan merusak commit an

SYNCING
#git remote
git remote -v
git remote add origin link git

#fetch and pull
git fetch:  mengambil commit saja.
git pull origin main : mengambil commit terbaru lalu otomatis menggabungkan (merge) dengan branch yang aktif.

#push
git push origin master
git push origin feature/login-user

BRANCHES :untuk melindungi main projek
#show all branch
git branch --list
#create a new branch called <branch>
git branch <branch>
#force delete the specified branch
git branch -D <branch>
#list remote branch
git branch -a

jangan lupa git push -u origin <branch>

PULL REQUEST: agar bisa berkontribusi thd repo yg sudah ada.


(image.png)