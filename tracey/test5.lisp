(defun amb (lis)
  (let ((i (length lis)))
    (nth (random i) lis)))

(defun origin ()
  (keep "hero" (name))
  (keep "heroPet" (animal))
  (story))

(defun story ()
  `(,(lookup "hero") traveled with her pet ,(lookup "heroPet")"."  ,(lookup "hero") was never ,(mood)"," for the ,(lookup "heroPet") was
    always too ,(mood)))

(defun mood ()
  (amb '(vexed indignant impassioned wistful astute coureous)))

(defun name () (amb '(Arjun Yuuma Darcy Mia Chiaki Izzi Azra Lina)))
(defun animal () (amb '(unicorn raven sparrow scorpion coyote eagle owl lizard zebra duck kitten)))

;; utilities
(defparameter names-alist nil)

(defun keep (name val)
  (push (cons name val) names-alist))

(defun lookup (name)
  (let ((pair (assoc name names-alist :test 'equal)))
    (cond ((null pair) '???)
	  (t (cdr pair)))))

(defun test5 ()
  (origin))

